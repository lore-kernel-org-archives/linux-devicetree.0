From: Rocco Folino <rocco.folino@gmail.com>
Subject: Re: [PATCH] MIPS: ath79: support devicetree selection
Date: Wed, 6 Sep 2017 15:59:59 +0200
Message-ID: <20170906135959.GA25439@void>
References: <b78cb3ef8df8531efdb7b011743ad3f38978015d.1503070362.git.rocco.folino@gmail.com>
 <20170906111435.GA1856@linux-mips.org>
 <20170906142005.67586253@avionic-0141>
 <20170906123200.GA21761@void>
 <20170906153543.412774d5@avionic-0141>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170906153543.412774d5@avionic-0141>
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: Ralf Baechle <ralf@linux-mips.org>, robh+dt@kernel.org, mark.rutland@arm.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Antony Pavlov <antonynpavlov@gmail.com>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 06, 2017 at 03:35:43PM +0200, Alban wrote:
> On Wed, 6 Sep 2017 14:32:00 +0200
> Rocco Folino <rocco.folino@gmail.com> wrote:
> 
> > On Wed, Sep 06, 2017 at 02:20:05PM +0200, Alban wrote:
> > > On Wed, 6 Sep 2017 13:14:35 +0200
> > > Ralf Baechle <ralf@linux-mips.org> wrote:
> > >   
> > > > On Fri, Aug 18, 2017 at 05:32:42PM +0200, Rocco Folino wrote:
> > > >   
> > > > > Allow to choose devicetrees from Kconfig.
> > > > > 
> > > > > Signed-off-by: Rocco Folino <rocco.folino@gmail.com>  
> > > 
> > > I don't really see the point of this patch. Building the dtb doesn't
> > > take any significant time, so why add this extra complexity?  
> > 
> > Because you need to select the SoC type in order to enable some
> > drivers, for example on the AR9331 to use the serial you need the
> > CONFIG_SERIAL_AR933X which depends on the CONFIG_SOC_AR933X.
> 
> Seeing as this driver is the only one that make use of CONFIG_SOC_AR933X
> I would prefer removing this dependency. It would also open the way to have
> the driver built in COMPILE_TEST. A few more fixes might be needed but that
> would be better than such a workaround.

Yes, I agree!

Thanks,

Rocco
