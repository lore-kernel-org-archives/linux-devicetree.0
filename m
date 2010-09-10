From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: How to define an I2C-to-SPI bridge device ?
Date: Fri, 10 Sep 2010 12:28:15 -0600
Message-ID: <20100910182815.GH11284@angua.secretlab.ca>
References: <1283502979.17812.22.camel@swa-m460>
	<20100903120858.GA19380@oksana.dev.rtsoft.ru>
	<4C84D334.6060008@matrix-vision.de>
	<c843f864-2a5a-4146-bd95-13c2fb91f430@email.android.com>
	<1284106293.2267.42.camel@swa-m460>
	<20100910173706.GD11284@angua.secretlab.ca>
	<1284142484.2152.18.camel@swa-e6500>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284142484.2152.18.camel@swa-e6500>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: =?iso-8859-1?Q?Andr=E9?= Schwarz <andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
Cc: LinuxPPC List <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, DevTreeDiscuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Anton Vorontsov <cbouatmailru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 10, 2010 at 08:14:44PM +0200, Andr=E9 Schwarz wrote:
> > > At first I thought about registering 4 SPI busses representing the 4 =
cs#
> > > lines and hide the cs# generation from the user. This would make
> > > multiple cs# assertions for a single write impossible which is a very
> > > useful feature.
> > =

> > The SPI subsystem doesn't directly support this use-case.  If you want
> > to do this, then assign another chip select number for the purpose of
> > enabling multiple CS lines at once... and be careful which drivers you
> > allow to be bound to the oddball CS number.  The in-kernel drivers
> > certainly don't support this use-case, and care must be taken to
> > ensure only one device is writing to the input line at a time.
> > =

> > What specific hardware do you need this feature for?
> =

> We have a board with multiple parallel video transmitters connected to
> an FPGA. Video timing and general parameters are always the same and
> there are quite a lot of settings to write during init/mode change.
> =

> Doing this in parallel will speed things up significantly.

Yeah; Then I would handle it as a separate cs# and map it to enabling
multiple CS lines at a time.

> BTW: would "drivers/misc" be a proper location ?
> Who's supposed to pick that driver up and on what list shall I post it
> for review ?

You should cc spi-devel-general, and feel free to cc me.  drivers/misc
would probably be an okay place for it to live; but if it only appears
on a single machine, then it may make more sense in
arch/*/<board-directory>.  What arch or SoC is this running on?

g.
