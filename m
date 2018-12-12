Return-Path: <SRS0=dIfH=OV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3892 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbeLLUPh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Dec 2018 15:15:37 -0500
Date: Wed, 12 Dec 2018 12:15:36 -0800
From: Sivaram Nair <sivaramn@nvidia.com>
Subject: Re: [PATCH 1/4] firmware: tegra: reword messaging terminology
Message-ID: <20181212201536.GA31765@sdt>
References: <1544643088-17678-1-git-send-email-talho@nvidia.com>
 <1544643088-17678-2-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1544643088-17678-2-git-send-email-talho@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Timo Alho <talho@nvidia.com>
Cc: treding@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 12, 2018 at 09:31:25PM +0200, Timo Alho wrote:
> As a preparatory change to refactor bpmp driver to support other than
> t186/t194 chip generations, reword and slightly refactor some of the
> functions to better match with what is actually happening in the
> wire-level protocol.
> 
> The communication with bpmp is essentially a Remote Procedure Call
> consisting of "request" and "response". Either side (BPMP or CPU) can
> initiate the communication. The state machine for communication
> consists of following steps (from Linux point of view):
> 
> Linux initiating the call:
>  1) check that channel is free to transmit a request (is_req_channel_free)
>  2) copy request message payload to shared location
>  3) post the request in channel (post_req)
>  4) notify BPMP that channel state has been update (ring_doorbell)

*updated*
