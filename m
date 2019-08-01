From: Han Xu <xhnjupt@gmail.com>
Subject: Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string to bindings
Date: Thu, 1 Aug 2019 10:22:54 -0500
Message-ID: <CA+EcR23hhD2=abMtNGDoW1LtXSE4qfjTy1uzU7sgrbi7W=KSbw@mail.gmail.com>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-2-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200837.GA7806@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190709200837.GA7806@bogus>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, bbrezillon@kernel.org, Kuldeep Singh <kuldeep.singh@nxp.com>, Ashish Kumar <Ashish.Kumar@nxp.com>, broonie@kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 3:09 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 19 Jun 2019 16:41:53 +0530, Ashish Kumar wrote:
> > There are 2 version of QSPI-IP, according to which controller registers sets
> > can be big endian or little endian.There are some other minor changes like
> > RX fifo depth etc.
> >
> > The big endian version uses driver compatible "fsl,ls1021a-qspi" and
> > little endian version uses driver compatible "fsl,ls2080a-qspi"
> >
> > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> > ---
> > v3:
> > Rebase to top
> > v2:
> > Convert to patch series and rebasing done on top of tree
> >
> >  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Han Xu <han.xu@nxp.com>

>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
