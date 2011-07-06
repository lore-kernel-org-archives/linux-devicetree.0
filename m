From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc/5200: mpc5200b.dtsi: add spi node address-
	and size-cells properties
Date: Wed, 6 Jul 2011 11:27:45 -0600
Message-ID: <20110706172745.GJ5805@ponder.secretlab.ca>
References: <1305561764-5942-1-git-send-email-agust@denx.de>
	<20110706114319.17af93a3@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110706114319.17af93a3@wker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2011 at 11:43:19AM +0200, Anatolij Gustschin wrote:
> Hi Grant,
> 
> can you please pick these patches for 3.1 ?
> 
> On Mon, 16 May 2011 18:02:43 +0200
> Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wrote:
> 
> > Both, #address-cells and #size-cells properties are required
> > for spi bus node, so add them.
> > 
> > Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>

Merged, thanks.

g.

> > ---
> >  arch/powerpc/boot/dts/mpc5200b.dtsi |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/arch/powerpc/boot/dts/mpc5200b.dtsi b/arch/powerpc/boot/dts/mpc5200b.dtsi
> > index bc27548..7ab286a 100644
> > --- a/arch/powerpc/boot/dts/mpc5200b.dtsi
> > +++ b/arch/powerpc/boot/dts/mpc5200b.dtsi
> > @@ -147,6 +147,8 @@
> >  		};
> >  
> >  		spi@f00 {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> >  			compatible = "fsl,mpc5200b-spi","fsl,mpc5200-spi";
> >  			reg = <0xf00 0x20>;
> >  			interrupts = <2 13 0 2 14 0>;
> 
> Thanks,
> Anatolij
