From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2] usb: chipidea: Hook into mux framework to toggle usb
 switch
Date: Tue, 17 Apr 2018 16:11:26 +0200
Message-ID: <ec1c44d7-45a8-a27e-5c45-717b87d3b252@axentia.se>
References: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523973148-2094-1-git-send-email-yossim@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yossi Mansharoff <yossim@codeaurora.org>, Peter Chen <Peter.Chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: robh@kernel.org, swboyd@chromium.org, devicetree@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: devicetree@vger.kernel.org

On 2018-04-17 15:52, Yossi Mansharoff wrote:
> On the db410c 96boards platform we have a TC7USB40MU on the board
> to mux the D+/D- lines coming from the controller between a micro
> usb "device" port and a USB hub for "host" roles[1]. During a
> role switch, we need to toggle this mux to forward the D+/D-
> lines to either the port or the hub. Add the necessary code to do
> the role switch in chipidea core via the generic mux framework.
> Board configurations like on db410c are expected to change roles
> via the sysfs API described in
> Documentation/ABI/testing/sysfs-platform-chipidea-usb2.

Ok, so this is v2. Please describe what is different from v1.
I have told you before that this information helps.

> [1] https://github.com/96boards/documentation/raw/master/ConsumerEdition/DragonBoard-410c/HardwareDocs/Schematics_DragonBoard.pdf

This link returns 404 for me.

Cheers,
Peter
