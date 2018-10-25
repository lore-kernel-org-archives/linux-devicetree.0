From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] mtd: partitions: Add RedBoot FIS DT bindings
Date: Thu, 25 Oct 2018 14:08:25 -0500
Message-ID: <20181025190825.GA15870@bogus>
References: <20181019070622.26661-1-linus.walleij@linaro.org>
 <20181019070622.26661-2-linus.walleij@linaro.org>
 <CACRpkda=1CNzZe1ACGm9nwVDGbHdAxhWzpqcANs-KKBhPpNF-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda=1CNzZe1ACGm9nwVDGbHdAxhWzpqcANs-KKBhPpNF-w@mail.gmail.com>
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
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Mark Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 09:27:24AM +0200, Linus Walleij wrote:
> Hi,
> 
> now just to forestall possible predictable bikeshedding on the devicetree
> list before it happens:
> 
> On Fri, Oct 19, 2018 at 9:06 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > +RedBoot FLASH Image System (FIS) Partitions
> 
> This expansion of the acronym including using capital letters in
> FLASH comes from the eCOS source code for RedBoot:
> https://sourceware.org/viewvc/ecos/packages/redboot/current/src/flash.c?view=markup
> 
> > +- compatible : (required) must be "redboot-fis"
> 
> There is no vendor here because the source code was owned by
> Cygnus Solutions, Redhat and now Free Software Foundation.
> https://en.wikipedia.org/wiki/ECos
> 
> We have no (AFAICT) policy for whether stuff that just change vendor
> all the time should be named after the inventing (first) company "cygnus,*",
> current owner "fsf,*" or the one that made most changes to the source
> code "redhat,*". I do not think we should care, and just name it
> "redboot-fis" for it's historical value and widespread acceptance so this
> is a conscious naming scheme.
> 
> If one of the OF maintainers says they want it a certain way I will change
> it without discussion, I just want this supported.

It's all fine for me.

I was only going to comment is Redboot still a thing? :)

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
