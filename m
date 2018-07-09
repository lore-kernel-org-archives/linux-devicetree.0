From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 1/2] gpio: mediatek: add driver for MT7621
Date: Mon, 9 Jul 2018 16:30:30 +0300
Message-ID: <20180709133030.fciif2sqxfavo6o3@mwanda>
References: <1530798191-25471-1-git-send-email-sergio.paracuellos@gmail.com>
 <1530798191-25471-2-git-send-email-sergio.paracuellos@gmail.com>
 <CACRpkdbWbFi-vzHqSu3T2iE89BJaQNCfZHVNvV7Crqq-TsLnmg@mail.gmail.com>
 <20180709132850.GB2529@foobar>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180709132850.GB2529@foobar>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, driverdev-devel@linuxdriverproject.org, juhosg@freemail.hu, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 03:28:50PM +0200, Sergio Paracuellos wrote:
> On Mon, Jul 09, 2018 at 01:45:22PM +0200, Linus Walleij wrote:
> > On Thu, Jul 5, 2018 at 3:43 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > 
> > > Add driver support for gpio of MT7621 SoC.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > Reviewed-by: NeilBrown <neil@brown.name>
> > 
> > This is looking really good.
> > 
> > Patch applied: anything remaining can surely be patched up
> > in-tree.
> >
> 
> Sound good, thanks.
> 
> Should I send a patch to remove the driver from staging or just
> is removed by Greg? How is this achieved?

Send a patch.

regards,
dan carpenter
