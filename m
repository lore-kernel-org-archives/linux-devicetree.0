From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of_i2c: I2C child node 10-bit client addressing
Date: Sat, 12 Jan 2013 20:03:47 -0700
Message-ID: <50F22413.60807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Bharat Kumar Reddy Gooty <bharat_404-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>, "Grant Likely (grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org)" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

FYI, re:

> https://lists.ozlabs.org/pipermail/devicetree-discuss/2012-November/022645.html

I know that was a long time ago, but I was searching for information on
which chips supported 10-bit I2C addresses, and found a partial answer
to the question:

Grant Likely wrote:
> Is it possible for a device to have an address that fits in the first 7
> bits, but still requires 10 bit address transactions?

The following chip (link below) certainly supports a 10-bit I2C address
with the top-most 3 bits set to 0. Now, it does also respond to a 7-bit
I2C address of the same value, so this perhaps isn't quite an exact
answer to Grant's question. However, it does indicate to me that we
shouldn't determine whether to use 7- or 10-bit addresses solely from
the set bits in the I2C address; a separate property or flag bit in the
address field would be better, I think.

http://www.ti.com/lit/ds/snvs839/snvs839.pdf

Quoting it:

> 7-BIT and 10-BIT ADDRESSING MODES
>
> The LM8330 supports both the 7-bit and 10-bit addressing modes as defined in the NXP (Philips) I 2 C
> Specification UM10204 rev 0.3 from 2007. The default 7-bit slave address is 0x88, and the default 10-bit slave
> address is 0x088. NOTE: The upper three address bits in 10-bit mode are hard tied to 0.
