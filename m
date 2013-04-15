From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Options to store device tree blob on NAND Flash
Date: Mon, 15 Apr 2013 14:28:41 +0100
Message-ID: <20130415132841.1F8FD3E0AA8@localhost>
References: <5148812D.4090305@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5148812D.4090305-i7dp0qKlBMg@public.gmane.org>
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
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 19 Mar 2013 16:15:57 +0100, Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org> wrote:
> Hello,
> 
> For embedded devices where NAND flash is the only storage media, I was wondering what 
> are the existing approaches on how to store the device tree blob in flash.
> Searching on the Internet I have found only two approaches:
>   1. Have a dedicated MTD partition for the device tree blob (raw).
>   2. Have a UBI volume on a partition and store the device tree blob as a file in a 
> UBIFS partition (this approach also stores the kernel image as a file in the same or 
> different volume).
> 
> Is anybody using other approach for storing the DTB in flash?
> What method is more widely used in embedded devices?

Either if fine providing U-Boot (or whatever) is able to read it. Having
the data in a filesystem is probably more convenient.

g.
