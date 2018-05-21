From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/14] dt-bindings: qcom_nandc: make
 nand-ecc-strength optional
Date: Mon, 21 May 2018 16:32:54 +0200
Message-ID: <20180521163254.71ade105@xps13>
References: <1525350041-22995-1-git-send-email-absahu@codeaurora.org>
        <1525350041-22995-4-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525350041-22995-4-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

On Thu,  3 May 2018 17:50:30 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> Now, nand-ecc-strength is optional. If specified in DT, then
> controller will use this ECC strength otherwise ECC strength will
> be calculated according to chip requirement and available OOB size.

Same comment as before: don't start the commit log with "now,".

Thanks,
Miquèl
