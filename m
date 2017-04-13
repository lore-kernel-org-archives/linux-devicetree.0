From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCHv4 0/2] Nokia H4+ support
Date: Thu, 13 Apr 2017 10:33:58 +0200
Message-ID: <3CE124E5-09B7-423D-B979-73564EB3BC6C@holtmann.org>
References: <20170413002659.25821-1-sre@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170413002659.25821-1-sre@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Linux Bluetooth <linux-bluetooth@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

> Here is the fourth revision of the nokia bluetooth patchset. Compared
> to the previous one the following things have changed:
> 
> * Drop patch 1-8 (applied by Marcel) and update Cc/To for patchset
> * Order includes in the driver alphabetically
> * Explicitly include <linux/of.h> in the nokia bluetooth driver
> 
> -- Sebastian
> 
> Sebastian Reichel (2):
>  dt-bindings: net: bluetooth: Add nokia-bluetooth
>  Bluetooth: add nokia driver

both patches have been applied to bluetooth-next tree.

Regards

Marcel
