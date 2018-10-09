From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH 14/14] dt-binding: mtd: physmap: Document the addr-gpios
 property
Date: Tue, 9 Oct 2018 09:56:47 +0200
Message-ID: <20181009095647.36b4c3a3@bbrezillon>
References: <20181008201027.17952-1-boris.brezillon@bootlin.com>
 <20181008201027.17952-15-boris.brezillon@bootlin.com>
 <CAPybu_0LYnWzgUX=HvY3HZUw8pLWTWR5ppG3TVG7S9dt_XitRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAPybu_0LYnWzgUX=HvY3HZUw8pLWTWR5ppG3TVG7S9dt_XitRw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Ricardo,

On Tue, 9 Oct 2018 09:43:16 +0200
Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:

> HI Boris
> 
> Usually they want the bindings to be sent before the changes. You
> might want to swap the order of 13 and 14

Sure.

>  And I think the version
> reviewed by Rob is too different to this version, maybe we want to
> ping him to be 100% sure that his review is still valid.

I'll drop his R-b then.

> 
> FWIW: To the whose serie, after you send the fixed version, you can
> add to all the patches my:
> Reviewed-by:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> 
> and to the last one:
> Tested-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> 
> Thanks a lot for the serie!

And thanks for testing+reviewing it.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
