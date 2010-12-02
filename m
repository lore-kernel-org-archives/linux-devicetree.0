From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] rtc/cmos: add OF bindings
Date: Wed, 1 Dec 2010 22:46:23 -0800
Message-ID: <AANLkTinF8GVv-HwKWCRx2jJoCZVWwNzBou3shi8OJj3S@mail.gmail.com>
References: <20101201101756.GA31624@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101201101756.GA31624-Hfxr4Dq0UpYb1SvskN2V4Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 1, 2010 at 2:17 AM, Sebastian Andrzej Siewior
<bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> This allows to load the OF driver based informations from the device
> tree. Systems without BIOS may need to perform some initialization.
> PowerPC creates a PNP device from the OF information and performs this
> kind of initialization in their private PCI quirk. This looks more
> generic.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> CC: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
> Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Hi Sebastian.

> +static struct of_platform_driver cmos_of_driver_probe = {

of_platform_drivers are deprecated and being removed.  Regular
platform_drivers can be assigned an of_match_table and the
platform_bus_type will use it to match drivers to devices.  Instead of
doing it this way, you can look for a device tree node in the existing
platform_drivers probe hook and if it exists then fetch the additional
data there.

g.
