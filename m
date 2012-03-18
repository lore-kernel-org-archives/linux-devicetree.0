From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: issues calling of_platform_bus_probe() twice
Date: Sun, 18 Mar 2012 09:08:04 +0000
Message-ID: <20120318090804.C70493E060A@localhost>
References: <31B4E554-FA95-431D-B353-92680CD14A0A@kernel.crashing.org>
 <1331933034.3105.171.camel@pasglop> <20120317072717.738953E08CE@localhost>
 <4F649304.9010001@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <4F649304.9010001@freescale.com>
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
Cc: "devicetree-discuss@lists.ozlabs.org Discuss" <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Sat, 17 Mar 2012 13:35:02 +0000, Tabi Timur-B04825 <B04825@freescale.com> wrote:
> Grant Likely wrote:
> >>> >  >  Are you aware of any reason that we can't call of_platform_bus_probe()
> >>> >  >  or multiple times.  Timur's run into an issue in which all devices
> >>> >  >  don't get registered properly if we call of_platform_bus_probe() times
> >>> >  >  with different of_device_id struct's.
> >> >
> >> >  Nothing comes to mind... Grant ?
> > Neither for me.  Should work.
> 
> I posted a work-around patch here:
> 
> http://patchwork.ozlabs.org/patch/128533/
> 
> Without this patch, drivers cannot probe on DMA *channels*, or any other 
> grandchildren of the root node.

That's because you're using it wrong.  of_platform_bus_probe() creates
platform devices at the starting level and every level below it as
described by the bus ids.  It is illegal to call of_platform_bus_probe()
twice at the same level in the DT.

g.
