From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 1/2] powerpc: document the Open PIC device tree binding
Date: Mon, 28 Feb 2011 00:44:07 -0700
Message-ID: <20110228074407.GC7855@angua.secretlab.ca>
References: <1298671177-19572-1-git-send-email-meador_inge@mentor.com>
	<1298671177-19572-2-git-send-email-meador_inge@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1298671177-19572-2-git-send-email-meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 25, 2011 at 03:59:36PM -0600, Meador Inge wrote:
> This binding documents several properties that have been in use for quite
> some time, and adds one new property 'pic-no-reset', which controls the runtime
> initialization behavior of the PIC.  More specifically, the presence of
> 'pic-no-reset' mandates that the PIC shall not be reset during runtime
> initialization and that any initialization related to interrupt sources
> shall be limited to sources explicitly referenced in the device tree.  This
> functionality is useful in AMP systems where multiple OSes are sharing the
> PIC and the reinitialization of the PIC can interfere with OSes that are
> already up and running.
> 
> The interrupt specifier definition is based off of Stuart Yoder's FSL MPIC
> binding.
> 
> Signed-off-by: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Cc: Hollis Blanchard <hollis_blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> Cc: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Looks fine to me, except...

> ---
>  Documentation/powerpc/dts-bindings/open-pic.txt |   98 +++++++++++++++++++++++

Documentation/powerpc/dts-bindings has moved to
Documentation/devicetree/bindings

g.
