From: John Linn <John.Linn-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: dtsi vs dts files, where to better understand this
Date: Wed, 21 Mar 2012 14:50:09 -0600
Message-ID: <d09d039e-88ba-41d3-ac51-8de1a11d806b@VA3EHSMHS032.ehs.local>
References: <89736f85-54aa-4f71-814e-91ae5ce33bdc@VA3EHSMHS017.ehs.local>
 <4F6A3BD3.4040805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <4F6A3BD3.4040805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, March 21, 2012 1:37 PM
> To: John Linn
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: dtsi vs dts files, where to better understand this
> 
> On 03/21/2012 12:36 PM, John Linn wrote:
> > Hi,
> >
> > I've done some digging and not found any info, maybe I looked in the
> > wrong places.
> >
> > I'm trying to better understand how the dtsi file works with the dts
> > file and what can go in each file.
> 
> The basic idea is that what's inside the SoC is identical across all
> boards using that SoC. This information is put into the .dtsi file so
> it
> can be included by the .dts file for any boards using the SoC.
> 
> Anything that's board-specific goes into the board's individual .dts
> file. This might be new nodes to e.g. define which chips are connected
> to an I2C bus hosted by the SoC, and much more.
> 
> Where properties existing in both, the most recent value in parsing
> order overrides any earlier values. So for example, if the .dtsi file
> said that 'status = "disabled"' for a particular HW module, the board
> .dts could later override it by saying 'status = "okay"' within the
> same
> node.
> 
> One other factor: Something like an SDHCI controller may have
> properties
> that are defined by the SoC (e.g. compatible, reg, interrupts), and
> properties that are defined by the board (e.g. the GPIO ID to use for
> CD, WP, etc.). Just set the relevant properties in the .dtsi and .dts
> files and they'll get merged together to form the final device tree.
> 
> Was that what you were looking for?

That was very helpful.  I was hoping there were details written
somewhere I had missed.  My apologies if I'm just not getting it yet :)

It's not clear to me how the hierarchy is maintained across both files
such as an i2c controller would be in the dtsi, while the i2c eeprom on
the bus is in the board file.

Do I have to duplicate the i2c controller (and the bus it's on also) in
the board file? It's not clear how smart the merge is.

The examples in the 3.3 tree don't seem that clear to me yet.

Thanks,
John



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
