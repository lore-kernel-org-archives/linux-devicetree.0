From: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [syslinux] [RFC 0/2] syslinux: Add device tree support
Date: Mon, 02 Jul 2012 06:05:06 -0700
Message-ID: <d441e9d4-628b-4810-a784-eaa0a14cdb20@email.android.com>
References: <1338478896-11417-1-git-send-email-thierry.reding@avionic-design.de>
 <4FEE2E42.2000707@zytor.com>
 <20120702064907.GB8683@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120702064907.GB8683-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, For discussion of Syslinux and tftp-hpa <syslinux-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It should be in linux.c32 in 4.06 and directly supported in 5.00.

Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:

>On Fri, Jun 29, 2012 at 03:37:54PM -0700, H. Peter Anvin wrote:
>> On 05/31/2012 08:41 AM, Thierry Reding wrote:
>> > This patch series adds support for passing a Flattened Device Tree
>(FDT)
>> > blob to the Linux kernel. Currently, only the linux.c32 module can
>do so
>> > and some additional checking should be done to only pass the blob
>if the
>> > kernel supports boot protocol 2.09 or later.
>> > 
>> > Thierry
>> 
>> Hi there,
>> 
>> I just merged a modified/more generic version of your patch.  I would
>> appreciate it if you could test it and report back.
>
>Tested latest master (59b77fc) and booted the system successfully. Can
>this still make it into the 5.00 release? Any chance of getting this
>directly supported by the ldlinux.sys?
>
>Thierry

-- 
Sent from my mobile phone. Please excuse brevity and lack of formatting.
