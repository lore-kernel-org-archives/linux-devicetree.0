From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: dtsi vs dts files, where to better understand this
Date: Wed, 21 Mar 2012 14:36:35 -0600
Message-ID: <4F6A3BD3.4040805@wwwdotorg.org>
References: <89736f85-54aa-4f71-814e-91ae5ce33bdc@VA3EHSMHS017.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <89736f85-54aa-4f71-814e-91ae5ce33bdc-+Ck8Kgl/v0+44QFJ4H5SYbjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/21/2012 12:36 PM, John Linn wrote:
> Hi,
> 
> I've done some digging and not found any info, maybe I looked in the
> wrong places.
> 
> I'm trying to better understand how the dtsi file works with the dts
> file and what can go in each file.

The basic idea is that what's inside the SoC is identical across all
boards using that SoC. This information is put into the .dtsi file so it
can be included by the .dts file for any boards using the SoC.

Anything that's board-specific goes into the board's individual .dts
file. This might be new nodes to e.g. define which chips are connected
to an I2C bus hosted by the SoC, and much more.

Where properties existing in both, the most recent value in parsing
order overrides any earlier values. So for example, if the .dtsi file
said that 'status = "disabled"' for a particular HW module, the board
.dts could later override it by saying 'status = "okay"' within the same
node.

One other factor: Something like an SDHCI controller may have properties
that are defined by the SoC (e.g. compatible, reg, interrupts), and
properties that are defined by the board (e.g. the GPIO ID to use for
CD, WP, etc.). Just set the relevant properties in the .dtsi and .dts
files and they'll get merged together to form the final device tree.

Was that what you were looking for?
