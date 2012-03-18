From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: issues calling of_platform_bus_probe() twice
Date: Sun, 18 Mar 2012 18:22:07 +0000
Message-ID: <20120318182207.627573E07BF@localhost>
References: <31B4E554-FA95-431D-B353-92680CD14A0A@kernel.crashing.org>
 <1331933034.3105.171.camel@pasglop> <20120317072717.738953E08CE@localhost>
 <4F649304.9010001@freescale.com> <20120318090804.C70493E060A@localhost>
 <4F6609DE.2050001@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4F6609DE.2050001@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Tabi Timur-B04825 <B04825@freescale.com>
Cc: "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>, "devicetree-discuss@lists.ozlabs.org Discuss" <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Sun, 18 Mar 2012 16:14:23 +0000, Tabi Timur-B04825 <B04825@freescale.com> wrote:
> Grant Likely wrote:
> > That's because you're using it wrong.  of_platform_bus_probe() creates
> > platform devices at the starting level and every level below it as
> > described by the bus ids.  It is illegal to call of_platform_bus_probe()
> > twice at the same level in the DT.
> 
> Well, *I* am not using it wrong.  Notice that my patch fixes (or works 
> around) the commit that *did* do it wrong:
> 
> http://patchwork.ozlabs.org/patch/126289/

Fair enough; I just wanted to point out that there it can only dig as
deep into the tree as is specified by the bus ids.  The exact problem
wasn't calling the function twice, but rather trying to call the
function twice from the same level of the tree.

BTW, I also recommend moving to of_platform_populate() for new code.
I think the behaviour is more consistent for fdt platforms and it
is more convenient for devices that are children of the root.

g.
