Return-Path: <psonek2@seznam.cz>
From: Radek Polak <psonek2@seznam.cz>
Subject: Re: [Gta04-owner] [PATCH 0/4] UART slave device support - version 4
Date: Thu, 21 Jan 2016 11:01:09 +0100
Message-ID: <1554849.ev0zdSM3Dl@rp-core>
In-Reply-To: <39B850CE-E381-4D3B-BD0A-84AFE7DAEEDF@goldelico.com>
References: <481E05A9-A192-438D-B092-D7700B30BBC4@goldelico.com> <20160120174610.1c64239a@lxorguk.ukuu.org.uk> <39B850CE-E381-4D3B-BD0A-84AFE7DAEEDF@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart6732326.BIPVdmqoIm"
Content-Transfer-Encoding: 7Bit
To: gta04-owner@goldelico.com
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Peter Hurley <peter@hurleysoftware.com>, Vostrikov Andrey <andrey.vostrikov@cogentembedded.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, NeilBrown <neil@brown.name>, Marek Belisko <marek@goldelico.com>, Jiri Slaby <jslaby@suse.cz>, tomeu@tomeuvizoso.net
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.

--nextPart6732326.BIPVdmqoIm
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 20 of January 2016 19:03:14 H. Nikolaus Schaller wrote:

> The assumption that there is  "the" user space of a given platform is 
wrong.

You can bundle initramfs with daemon that does the GPS power control.

QtMoko and some old SHR versions use initramfs [1] for advanced boot 
options. IMO it works great and could be extended to control GPS. And 
your kernel with such initramfs will have GPS always powered properly.

Radek


[1] https://github.com/radekp/gta04-init

--nextPart6732326.BIPVdmqoIm
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'DejaVu Sans Mono'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On Wednesday 20 of January 2016 19:03:14 H. Nikolaus Schaller wrote:</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt; The assumption that there is  &quot;the&quot; user space of a given platform is wrong.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">You can bundle initramfs with daemon that does the GPS power control.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">QtMoko and some old SHR versions use initramfs [1] for advanced boot options. IMO it works great and could be extended to control GPS. And your kernel with such initramfs will have GPS always powered properly.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Radek</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[1] https://github.com/radekp/gta04-init</p></body></html>
--nextPart6732326.BIPVdmqoIm--
