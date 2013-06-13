From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree flattening code not copying properties from blob
Date: Fri, 14 Jun 2013 00:47:43 +0100
Message-ID: <CACxGe6s+Br8mYDfULsDcA9Ym3mqtyXZ41uK1un-nzcZH0BHtDg@mail.gmail.com>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
 <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com>
 <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF975@corpatsmail4.corp.sensis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF975-gEjpXB0kThW1wM3WIAwN2vV4jgPAACGKVpNB7YpNyf8@public.gmane.org>
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
To: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2013 at 11:49 PM, Collins, Rod
<Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
> Grant
>
> What is considered the correct way to include the blob in the build so
> that it is not removed?

Don't put it in an __init section.  :-p

However, I realized that the .dtb.S target does exactly that under the
assumption that multiple blobs may be linked into the kernel, but only
one actually used. The correct thing to do in your case is indeed copy
the blob at boot.

Actually, the best thing to do is to not link the dtb into the kernel
at all. Either append it as another payload or pass it in via the
bootloader and make the kernel mark the dtb memory as reserved.
Statically linking into the kernel proper means the kernel needs to be
rebuilt for each and every target which neuters one of the reasons for
using device tree in the first place.

g.
