From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH v1 2/3] dt-bindings: mailbox: Document
 armada-37xx-rwtm-mailbox binding
Date: Thu, 20 Dec 2018 23:08:21 +0100
Message-ID: <20181220230821.3f21163a@nic.cz>
References: <20181217153706.25873-1-marek.behun@nic.cz>
        <20181217153706.25873-2-marek.behun@nic.cz>
        <20181220214447.GA18008@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220214447.GA18008@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > +- compatible :	must be "marvell,armada-37xx-rwtm-mailbox"  
> 
> Don't use wildcards in compatible strings.
> 

You mean that "mailbox" shouldn't be there?

Marek
