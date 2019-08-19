From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 2/2] dt-bindings: mtd: Document Macronix raw NAND
 controller bindings
Date: Mon, 19 Aug 2019 14:21:43 -0500
Message-ID: <CAL_JsqJB7JgSTcp9oVhnqxp7Xq4P1wj_sxggN-r7RXd8pOQ2xQ@mail.gmail.com>
References: <1566199149-5669-1-git-send-email-masonccyang@mxic.com.tw> <1566199149-5669-3-git-send-email-masonccyang@mxic.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566199149-5669-3-git-send-email-masonccyang@mxic.com.tw>
Sender: linux-kernel-owner@vger.kernel.org
To: Mason Yang <masonccyang@mxic.com.tw>
Cc: =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <bbrezillon@kernel.org>, Brian Norris <computersforpeace@gmail.com>, Vignesh R <vigneshr@ti.com>, Stefan Agner <stefan@agner.ch>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Julien Su <juliensu@mxic.com.tw>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Burton <paul.burton@mips.com>, Liang Yang <liang.yang@amlogic.com>, MTD Maling List <linux-mtd@lists.infradead.org>, anders.roxell@linaro.org, Christophe Kerello <christophe.kerello@st.com>, Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 1:55 AM Mason Yang <masonccyang@mxic.com.tw> wrote:
>
> Document the bindings used by the Macronix raw NAND controller.
>
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mxic-nand.txt

I would ask for this to use DT schema, but given it is v7 already:

Reviewed-by: Rob Herring <robh@kernel.org>
