From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Date: Mon, 6 Mar 2017 22:02:38 +0100
Message-ID: <20170306220238.6cc3a897@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <20170302221803.223ff23b@bbrezillon> <20170303133629.3aac2945@tock>
 <20170303143658.5d89a329@bbrezillon> <20170303145726.16cd67fd@tock>
 <20170303151107.36754d19@bbrezillon>
 <54c76650-b61f-8a4c-70c7-febe76e16d3b@nod.at>
 <20170306182147.65d59d33@avionic-0020>
 <ad8f9469-2574-4fb5-2baa-37c6bca0dfa8@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <ad8f9469-2574-4fb5-2baa-37c6bca0dfa8@nod.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alban <albeu@free.fr>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Mon, 6 Mar 2017 20:03:28 +0100
Richard Weinberger <richard@nod.at> wrote:

> Am 06.03.2017 um 18:21 schrieb Alban:
> > On Fri, 3 Mar 2017 23:21:29 +0100
> > Richard Weinberger <richard@nod.at> wrote:
> >   
> >> Am 03.03.2017 um 15:11 schrieb Boris Brezillon:  
> >>>> And add a list of successfully added notifiers, along with their
> >>>> data pointer, to the MTD device. That's simple and would also remove
> >>>> the need for notifier to have a private list of their instances as I
> >>>> had to do here.    
> >>>
> >>> And then you're abusing the notifier concept. As said earlier, a
> >>> notifier is not necessarily using the device, and thus, don't
> >>> necessarily need private data.
> >>> It's not only about what is the simplest solution for your use case,
> >>> but also what other users want/need.    
> >>
> >> Yes, please don't use the mtd_notifier.
> >> I strongly vote to embed the nvmem pointer into struct mtd_info.  
> > 
> > Ok, I'll do that. However it mean it will have to stays in
> > drivers/mtd as it then become part of the MTD core.  
> 
> Brian, are you fine with this?

Same question to Srinivas.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
