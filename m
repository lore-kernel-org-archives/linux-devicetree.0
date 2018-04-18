From: yossim@codeaurora.org
Subject: Re: [PATCH v2] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Wed, 18 Apr 2018 08:48:10 +0300
Message-ID: <e75dff8424debcabd79f36faf3b23aaf@codeaurora.org>
References: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
 <ec1c44d7-45a8-a27e-5c45-717b87d3b252@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ec1c44d7-45a8-a27e-5c45-717b87d3b252@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, robh@kernel.org, swboyd@chromium.org, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

On 2018-04-17 17:11, Peter Rosin wrote:
> On 2018-04-17 15:52, Yossi Mansharoff wrote:
>> On the db410c 96boards platform we have a TC7USB40MU on the board
>> to mux the D+/D- lines coming from the controller between a micro
>> usb "device" port and a USB hub for "host" roles[1]. During a
>> role switch, we need to toggle this mux to forward the D+/D-
>> lines to either the port or the hub. Add the necessary code to do
>> the role switch in chipidea core via the generic mux framework.
>> Board configurations like on db410c are expected to change roles
>> via the sysfs API described in
>> Documentation/ABI/testing/sysfs-platform-chipidea-usb2.
> 
> Ok, so this is v2. Please describe what is different from v1.
> I have told you before that this information helps.
> 
>> [1] 
>> https://github.com/96boards/documentation/raw/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf
> 
> This link returns 404 for me.
> 
> Cheers,
> Peter


Hi,
This patch was split apart from the original patch into two patches
one for chipidea and the other for bindings.
this patch has no other changes two the code.

I will update the link.

thanks
Yossi
