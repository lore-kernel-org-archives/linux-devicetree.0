From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH v2] mtd: dataflash: add device tree probe support
Date: Thu, 14 Jul 2011 21:52:02 +0400
Message-ID: <20110714175013.GA17845@belfalas.ww600.siemens.net>
References: <1310283313-32087-1-git-send-email-shawn.guo@linaro.org>
	<1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1310658757-17018-1-git-send-email-shawn.guo@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, patches@linaro.org, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 14, 2011 at 11:52:37PM +0800, Shawn Guo wrote:
> It adds device tree probe support for mtd_dataflash driver.
> =

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> Changes since v1:
>  * Add "atmel,at45xxx" into the match table
>  * Add binding document

I=B4m sorry for being unclean on this. Device family is just at45,
so I=B4d suggest the following compatibility list:
"atmel,at45d789000", "atmel,at45"

You might want to add "atmel,dataflash" or "mtd,dataflash", but I see
no point in that.

-- =

With best wishes
Dmitry


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
