Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54403C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B89A2074B
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgFIRnC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 13:43:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51602 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728472AbgFIRnB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 13:43:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 77DE12A07B0
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Philippe CORNU <philippe.cornu@st.com>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        dl-linux-imx <linux-imx@nxp.com>, kernel@collabora.com,
        linux-stm32@st-md-mailman.stormreply.com,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v9 11/11] Documentation: gpu: todo: Add dw-mipi-dsi
 consolidation plan
In-Reply-To: <CAKMK7uGLQCj_oJcbXynt_1bmwBQy6ncUgc49DPejyfCtb68e_g@mail.gmail.com>
References: <20200609162700.953260-1-adrian.ratiu@collabora.com>
 <20200609162700.953260-12-adrian.ratiu@collabora.com>
 <CAKMK7uGLQCj_oJcbXynt_1bmwBQy6ncUgc49DPejyfCtb68e_g@mail.gmail.com>
Date:   Tue, 09 Jun 2020 20:44:26 +0300
Message-ID: <87sgf4i16t.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 09 Jun 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Jun 9, 2020 at 6:25 PM Adrian Ratiu 
> <adrian.ratiu@collabora.com> wrote: 
>> 
>> This documents the longer-term plan to cleanup the dw-mipi-dsi 
>> bridge based drivers after the regmap refactor and i.MX6 driver 
>> have landed. 
>> 
>> The goal is to get the entire bridge logic in one place and 
>> continue the refactorings under the drm/bridge tree. 
>> 
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com> Cc: 
>> Boris Brezillon <boris.brezillon@collabora.com> Cc: Sam 
>> Ravnborg <sam@ravnborg.org> Cc: Daniel Vetter 
>> <daniel.vetter@ffwll.ch> Signed-off-by: Adrian Ratiu 
>> <adrian.ratiu@collabora.com> 
> 
> This cc's the world, but not dri-devel. Can you pls resubmit 
> with that added? 

Yes, sorry about omitting dri-devel, it was unintentional. Will 
resubmit the same version.

Adrian

>
> Thanks, Daniel
>
>> ---
>>  Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
>> index 658b52f7ffc6c..2b142980a4b16 100644
>> --- a/Documentation/gpu/todo.rst
>> +++ b/Documentation/gpu/todo.rst
>> @@ -548,6 +548,31 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
>>
>>  Contact: Harry Wentland, Alex Deucher
>>
>> +Reorganize dw-mipi-dsi bridge-based host-controller drivers
>> +-----------------------------------------------------------
>> +
>> +The Synopsys DW MIPI DSI bridge is used by a number of SoC platform drivers
>> +(STM, Rockchip, i.MX) which don't cleanly encapsulate their bridge logic which
>> +gets split between the Synopsys bridge (drm/bridge/synopsys/dw-mipi-dsi.c) and
>> +platform drivers like drm/imx/dw_mipi_dsi-imx6.c by passing around the bridge
>> +configuration regmap, creating new bridges / daisy chaining in platform drivers,
>> +duplicating encoder creation, having too much encoder logic instead of using the
>> +simple encoder interface and so on.
>> +
>> +The goal of this rework is to make the dw-mipi-dsi driver a better encapsulated
>> +bridge by moving all bridge-related logic under drm/bridge, including the SoC
>> +bindings which chain to the core Synopsys code under drm/bridge/dw-mipi-dsi/
>> +from which they can be further consolidated and cleaned up.
>> +
>> +If this goal proves to be impossible then drm_bridge might not be the correct
>> +abstraction for these host controllers and unifying their logic into a helper
>> +library encapsulating a drm_encoder might be more desirable, in other words to
>> +move away from drm_bridge entirely.
>> +
>> +Contact: Adrian Ratiu, Daniel Vetter, Laurent Pinchart
>> +
>> +Level: Intermediate
>> +
>>  Bootsplash
>>  ==========
>>
>> --
>> 2.27.0
>>
>
>
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
