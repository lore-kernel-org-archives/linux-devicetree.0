Return-Path: <devicetree-owner@kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:51311 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751555AbcBWWLS (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 23 Feb 2016 17:11:18 -0500
Date: Tue, 23 Feb 2016 23:10:42 +0100
From: Karsten Merker <merker@debian.org>
Subject: Re: [linux-sunxi] [PATCH v2] ARM: dts: sun7i: Add dts file for the
 lamobo-r1 board
Message-ID: <20160223221041.GA2992@excalibur.cnev.de>
References: <1456260090-23635-1-git-send-email-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1456260090-23635-1-git-send-email-hdegoede@redhat.com>
Sender: devicetree-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Jelle de Jong <jelledejong@powercraft.nl>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree <devicetree@vger.kernel.org>, dev@linux-sunxi.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 23, 2016 at 09:41:30PM +0100, Hans de Goede wrote:
> From: Jelle de Jong <jelledejong@powercraft.nl>
> 
> The lamobo-r1 board, sometimes called the BPI-R1 but not labelled as such
> on the PCB, is meant as a A20 based router board. As such the board comes
> with a built-in switch chip giving it 5 gigabit ethernet boards, and it

s/gigabit ethernet boards/gigabit ethernet ports/ ?

> has a large empty area on the pcb with mounting holes which will fit a
> 2.5 inch harddisk. To complete its networking features it has a
> Realtek RTL8192CU for WiFi 802.11 b/g/n.
> 
> Signed-off-by: Jelle de Jong <jelledejong@powercraft.nl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Regards,
Karsten
-- 
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
sowie der Weitergabe meiner personenbezogenen Daten für Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
