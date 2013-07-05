From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Appended DTB files for multi-machine kernels
Date: Fri, 05 Jul 2013 12:36:11 -0600
Message-ID: <51D7121B.50704@wwwdotorg.org>
References: <51D5A938.30607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51D5A938.30607-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Sven Neumann <s.neumann-5g8ninUHluJWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/04/2013 10:56 AM, Daniel Mack wrote:
...
> The built-in support for attaching a DTB to the zImage does not suffice
> here, because we have one image for all models, and also, we couldn't do
> a 'per-board-revision' selection that way either.
...
> As a solution, I'm thinking of a small framework that could for example
> work as follows.
> 
> a) A small mechanism allows storing multiple DTB binary files inside the
> kernel binary at compile time...
...
> c) Allow users to open-code the DTB lookup depending on whatever kind of
> runtime information (be it the board_revision or anything else).

The problem with (c) is that in general it probably requires a lot of
infra-structure to be working to implement it. On Tegra, the board
revision is in an EEPROM attached to an I2C bus. You'd need to have
parsed DT and started instantiating devices already before you could
access the ID EEPROM to know which board revision you're running on.
That's a bit of a chicked-and-egg problem. Even with a much simpler
scheme such as board ID encoded into GPIOs, you'll still likely run into
similar problems; pinmux and GPIO controller drivers are needed just to
read the GPIOs, which then requires DT to instantiate those drivers.

So, the suggestion of Nicolas's that you mentioned does solve that
rather neatly.
