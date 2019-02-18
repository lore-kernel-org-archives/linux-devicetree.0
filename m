From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] mtd: add DT bindings for the Intel IXP4xx Flash
Date: Mon, 18 Feb 2019 15:29:24 -0600
Message-ID: <CAL_Jsq+tXtTftYKqp1YG=wU1JTtsXkh+Zjq6QwHuYg2=ahgKTw@mail.gmail.com>
References: <20190201100421.27504-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190201100421.27504-1-linus.walleij@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, MTD Maling List <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 1, 2019 at 4:04 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This adds device tree bindings for the Intel IXP4xx
> flash controller, a simple physmap which however need a
> specific big-endian or mixed-endian access pattern to the
> memory.
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/mtd/intel,ixp4xx-flash.txt       | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,ixp4xx-flash.txt

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
