From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/5] Marvell PXA1928 USB support
Date: Fri, 15 May 2015 16:11:34 +0200
Message-ID: <2878212.YRcsYyF5mD@wuerfel>
References: <1431557340-5421-1-git-send-email-robh@kernel.org> <5555C2A5.8010509@gmail.com> <CAL_Jsq+1JXJGVAA42iw7haSMkWEpV0KOo0h3AVhO5-DQ-GfRcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+1JXJGVAA42iw7haSMkWEpV0KOo0h3AVhO5-DQ-GfRcg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Friday 15 May 2015 07:48:24 Rob Herring wrote:
> 
> > Anyway, if you are introducing new PHY drivers with _that_ generic
> > names, it will either clash with every other Marvell USB PHYs -
> > or we'll have to add the PHY code into the drivers above.
> 
> How about phy-pxa-28nm-{usb2,hsic}?
> 

Seems ok to me, but please verify that these are actually usb2 and hsic
specific devices. There are a lot of PHY implementations that share the
basic layout between devices for different purposes, e.g. USB3 and PCIe
and they should have a name that is not too specific for one connection
when the same driver gets reused by another part.

	Arnd
