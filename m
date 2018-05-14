From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Mon, 14 May 2018 09:21:36 +0200
Message-ID: <4abbe781-f488-b876-06a0-5521736c4d6c@axentia.se>
References: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
 <ec1c44d7-45a8-a27e-5c45-717b87d3b252@axentia.se>
 <e75dff8424debcabd79f36faf3b23aaf@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e75dff8424debcabd79f36faf3b23aaf@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: yossim@codeaurora.org
Cc: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, robh@kernel.org, swboyd@chromium.org, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

On 2018-04-18 07:48, yossim@codeaurora.org wrote:
> On 2018-04-17 17:11, Peter Rosin wrote:
>> On 2018-04-17 15:52, Yossi Mansharoff wrote:
>>> On the db410c 96boards platform we have a TC7USB40MU on the board
>>> to mux the D+/D- lines coming from the controller between a micro
>>> usb "device" port and a USB hub for "host" roles[1]. During a
>>> role switch, we need to toggle this mux to forward the D+/D-
>>> lines to either the port or the hub. Add the necessary code to do
>>> the role switch in chipidea core via the generic mux framework.
>>> Board configurations like on db410c are expected to change roles
>>> via the sysfs API described in
>>> Documentation/ABI/testing/sysfs-platform-chipidea-usb2.
>>
>> Ok, so this is v2. Please describe what is different from v1.
>> I have told you before that this information helps.
>>
>>> [1] 
>>> https://github.com/96boards/documentation/raw/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf
>>
>> This link returns 404 for me.
>>
>> Cheers,
>> Peter
> 
> 
> Hi,
> This patch was split apart from the original patch into two patches
> one for chipidea and the other for bindings.
> this patch has no other changes two the code.
> 
> I will update the link.

Just a note: I will not feed the mux_control_get_optional patch upstream
until I feel confident that this patch is going also heading upstream.

Cheers,
Peter
