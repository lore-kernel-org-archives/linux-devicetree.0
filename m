From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v4] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Fri, 16 Mar 2012 13:33:22 +0100
Message-ID: <201203161333.22524.sr@denx.de>
References: <1331890216-8361-1-git-send-email-sr@denx.de>
 <20120316115022.GF7757@game.jcrosoft.org> <201203161209.18292.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201203161209.18292.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 16 March 2012 13:09:18 Arnd Bergmann wrote:
> On Friday 16 March 2012, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 10:30 Fri 16 Mar     , Stefan Roese wrote:
> > > This patch adds a generic target for SPEAr600 board that can be
> > > configured via the device-tree. Currently the following devices
> > > are supported via the devicetree:
> > > 
> > > - VIC interrupts
> > > - PL011 UART
> > > - PL061 GPIO
> > > - Synopsys DW I2C
> > > - Synopsys DW ethernet
> > > 
> > > Other peripheral devices (e.g. SMI flash, FSMC NAND flash etc) will
> > > follow in later patches.
> > 
> > so drop USB, nand & co from the dtsi
> > 
> > this will be add later when the binding will documentated and Acked
> 
> I actually like to see the devices in there, and it already helped
> figure out that there are two buses instead of just one. Maybe we
> can agree on putting them in the file but commenting them out using
> /* */ with an added notice that they will get enabled once we have
> bindings?

It would be great to have a decision on this. I'm leaving for a short vacation 
in a few hours and would like to have the new (hopefully final) patch out 
before that.

Thanks for all your comments,
Stefan
