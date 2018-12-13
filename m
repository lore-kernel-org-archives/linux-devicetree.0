From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH RFC] ARM64: dts: marvell: Add DTS file for Turris Mox
Date: Thu, 13 Dec 2018 05:08:29 +0100
Message-ID: <20181213050829.6d942510@nic.cz>
References: <20181113134408.5681-1-marek.behun@nic.cz>
        <20181204203706.GA25038@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204203706.GA25038@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

Hi Rob

On Tue, 4 Dec 2018 14:37:06 -0600
Rob Herring <robh@kernel.org> wrote:

> > +
> > +	switch1@2 {  
> 
> Ideally, we shouldn't have this switch0, switch1, etc.

I can rename peridot switches (switch0@10, switch1@11, switch2@12 to
swtich@10, switch@11, switch@12), but I cannot rename Topaz to
switch@2. Topaz always has MDIO address 2, because there can be only
one, but it can be connected either directly or after the first or
second peridot. Therefore I have three different nodes, each describing
different connection to the previous switch/cpu.

How should I rename it?

Marek
