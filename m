From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/3] ARM: at91: use chipid device for soc detection
Date: Tue, 29 Mar 2016 16:30:29 +0200
Message-ID: <3656574.4DhkCSPNfU@wuerfel>
References: <55618572.U3p4crGV1Y@wuerfel> <1459260638-3899-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459260638-3899-1-git-send-email-nicolas.ferre@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Ludovic Desroches <ludovic.desroches@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 March 2016 16:10:38 Nicolas Ferre wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> So far, the CIDR and EXID registers were in the DBGU interface. This device
> has disappeared with the SAMA5D2 family. These registers are exposed
> through a new device called chipid.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> [nicolas.ferre@atmel.com: remove useless warnings]
> Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> [arnd@arndb.de: suggest to use static functions to reduce scope]
> 

(whole series)

Acked-by: Arnd Bergmann <arnd@arndb.de>
