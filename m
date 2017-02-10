From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 0/2] Add a "label" property to the mtd device
Date: Fri, 10 Feb 2017 10:31:11 -0800
Message-ID: <20170210183111.GB125303@google.com>
References: <1486632068-14894-1-git-send-email-clg@kaod.org>
 <ceb3ad29-a5fc-86d5-a2f3-dd2c1620fc57@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ceb3ad29-a5fc-86d5-a2f3-dd2c1620fc57@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 09, 2017 at 09:25:32PM +0100, Marek Vasut wrote:
> On 02/09/2017 10:21 AM, C=E9dric Le Goater wrote:
> > Hello,
> > =

> > Herer are a couple of patches adding a "label" property to the mtd
> > device, which can be used to identify a specific chip on a system with
> > multiple chips. This is common on the OpenPower boards, there can be
> > four chips holding the firmware for the BMC and the firmware for the
> > host, plus chips with golden images for recovery.
> =

> Series is
> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Applied to l2-mtd.git.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
