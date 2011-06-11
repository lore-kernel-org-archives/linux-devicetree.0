From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Please cherry-pick "tty/serial: Add explicit PORT_TEGRA type" to
	devicetree/test
Date: Fri, 10 Jun 2011 20:35:25 -0600
Message-ID: <20110611023525.GA11600@ponder.secretlab.ca>
References: <74CDBE0F657A3D45AFBB94109FB122FF0498A47E0E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0498A47E0E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2011 at 12:42:25PM -0700, Stephen Warren wrote:
> Grant, could you please cherry-pick, or otherwise pick up:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty-2.6.git
> 4539c24fe4f92c09ee668ef959d3e8180df619b9
> tty/serial: Add explicit PORT_TEGRA type
> (from the tty-next branch)
> 
> Into your devicetree/test branch. With that in place, I'll be able to
> fix up the of_serial.c registration for nvidia,tegra250-uart to use
> PORT_TEGRA instead of PORT_XSCALE, as we discussed earlier.

Hi Stephen.

I never did get the chance to actually cherry pick this, but
devicetree/test has since been rebased to v3.0-rc2, so all
should be good.  I'll also fixup the PORT_TEGRA bit in my tree.

g.
