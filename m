From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v1 2/3] dt-bindings: mailbox: Document armada-37xx-rwtm-mailbox binding
Date: Fri, 21 Dec 2018 07:13:43 +0200
Message-ID: <8736qr8nso.fsf@tkos.co.il>
References: <20181217153706.25873-1-marek.behun@nic.cz> <20181217153706.25873-2-marek.behun@nic.cz> <20181220214447.GA18008@bogus> <20181220230821.3f21163a@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181220230821.3f21163a@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Behun <marek.behun@nic.cz>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Marek,

Marek Behun writes:
>> > +- compatible :	must be "marvell,armada-37xx-rwtm-mailbox"  
>> 
>> Don't use wildcards in compatible strings.
>
> You mean that "mailbox" shouldn't be there?

You should use '3700' instead of '37xx'.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
