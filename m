From: Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>
Subject: Re: [PATCH 1/2] gpiolib: add gpio_export_with_name
Date: Thu, 30 May 2013 11:19:33 +0200
Message-ID: <51A719A5.50906@epfl.ch>
References: <20121121101259.GQ4398@game.jcrosoft.org>
 <1353492849-29397-1-git-send-email-plagnioj@jcrosoft.com>
 <20121126135911.2F1D33E187C@localhost>
Reply-To: florian.vaussard-p8DiymsW2f8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121126135911.2F1D33E187C@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Grant,

On 11/26/2012 02:59 PM, Grant Likely wrote:
> On Wed, 21 Nov 2012 11:14:08 +0100, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
>> allow to specify a name to an exported gpio
>>
>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>
> The gpio sysfs ABI is already horrible, racy, and unsafe. Really, we
> need a proper chrdev interface for controlling gpios. Sysfs is fine for
> poking around and experimenting, but we cannot provide any fine grained
> access control, locking or faster IO with the one-file-per-gpio sysfs
> model. So, no, I don't think this is a good idea to extend gpiolib in
> this way.
>

Would it make sense to provide only the DT binding to export a GPIO,
without changing the sysfs ABI? Even if work is progressing towards
having gpio-controlled reset pins [1], some boards still need GPIOs to
be exported to userspace for other functionalities.

Regards,

Florian

[1] http://article.gmane.org/gmane.linux.power-management.general/31364
