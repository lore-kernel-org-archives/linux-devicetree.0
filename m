From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mtd: document new "on-die" nand-ecc-mode
Date: Fri, 24 Mar 2017 11:18:57 -0500
Message-ID: <20170324161857.vojqlt2l2u7pwbqm@rob-hp-laptop>
References: <1490092686-16509-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1490092686-16509-2-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1490092686-16509-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 11:38:02AM +0100, Thomas Petazzoni wrote:
> A number of NAND chips support a feature called on-die ECC, where the
> NAND chip itself is capable of doing error detection and correction. The
> new "on-die" value for nand-ecc-mode indicates that we want this
> functionality to be used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
