From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: DT and endianness
Date: Wed, 18 May 2011 09:56:17 -0600
Message-ID: <BANLkTi=7s0p8qXLoirSZksyfkx3vBhYCBQ@mail.gmail.com>
References: <4DD38BFA.7090904@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4DD38BFA.7090904-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 18, 2011 at 3:06 AM, Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org> wrote:
> Hey Grant,
>
> I have been working over the last few days trying to
> evaluate what part of the data files in OMAP can be moved
> to Device tree. One basic issue I am stuck with trying
> to extract data out of the device tree blob is the
> endianess differences. The dtb file seems to be in
> big-endian format while my kernel is compiled for
> little-endian. I know this might be quite a common
> issue with all ARM arch;s but I could not find any
> obvious pointers on how to get around this.
> Any help is greatly appreciated.

Yes, the dtb data is always big-endian encoded, regardless of
architecture.  This is on purpose so that any arch can parse any other
architecture's dtb format.  be32_to_cpu() is your friend.

g.


>
> Thanks,
> Rajendra
>



-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
