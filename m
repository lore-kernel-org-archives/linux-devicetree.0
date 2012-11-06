From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [U-Boot] Merging device trees at runtime for module-based systems
Date: Tue, 6 Nov 2012 23:05:19 +0000
Message-ID: <CACxGe6vxA9srJvzk2QXRwfNvFs308RT8tfxKTF+qim5d8XoQbA@mail.gmail.com>
References: <5087B919.2010006@gmail.com> <508AD8F9.8030105@wwwdotorg.org>
 <5091AD78.3060701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5091AD78.3060701-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2012 at 11:00 PM, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> cc devicetree-discuss. Here's a reference to the full thread:
>
>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145221/

Interesting. I only just was made aware of this thread. There is a
similar discussion going on kicked off by the BeagleBone folks where
they want to insert additional DT data from Linux userspace. Whether
the data is merged at U-Boot time or kernel time, I expect that the
required data format will be very similar.

https://lkml.org/lkml/2012/10/31/502
https://lkml.org/lkml/2012/11/5/615

I'm trying to draft up a document that captures the requirements and
lay out what needs to be done to the tools, U-Boot and the kernel.

g.
