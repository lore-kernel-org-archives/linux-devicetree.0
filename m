From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Add G762/G763 PWM fan controller
Date: Tue, 28 May 2013 08:42:12 -0700
Message-ID: <20130528154212.GB21891@roeck-us.net>
References: <cover.1369687670.git.arno@natisbad.org>
 <152190814.eApXVbVBPA@wuerfel> <87li6z2yxj.fsf@natisbad.org>
 <20130528111921.GD11547@mithrandir>
 <20130528122940.GA29012@roeck-us.net>
 <20130528134734.GA12585@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130528134734.GA12585@mithrandir>
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
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Olivier Mouchet <olivier.mouchet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2013 at 03:47:49PM +0200, Thierry Reding wrote:
> On Tue, May 28, 2013 at 05:29:40AM -0700, Guenter Roeck wrote:
> > On Tue, May 28, 2013 at 01:19:23PM +0200, Thierry Reding wrote:
> > > On Tue, May 28, 2013 at 12:15:04PM +0200, Arnaud Ebalard wrote:
> > > > Hi Arnd,
> > > > 
> > > > Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
> > > > 
> > > > > On Tuesday 28 May 2013 00:02:29 Arnaud Ebalard wrote:
> > > > >> 
> > > > >> This series adds support for GMT G762/G763. This work is based on a
> > > > >> basic version for 2.6.31 kernel developed Olivier Mouchet for LaCie
> > > > >> NAS. Updates have been performed to run on recent kernels. Support has
> > > > >> been completed and additional features added: ability to configure
> > > > >> various characteristics from .dts file, better initialization, alarms
> > > > >> and error reporting support, gear mode, polarity, fan pulse per
> > > > >> revolution, fan startup voltage control.
> > > > >
> > > > > I wonder if this could be split into two separate drivers, one for
> > > > > the pwm subsystem, and one for a hardware-independent fan controller
> > > > > based on the pwm interfaces.
> > > > 
> > > > To be honest, I wouldn't even know how to start in order to do that.
> > > > Additionally, it would be worth the effort if other drivers could be
> > > > easily refactored using this idea. I'll let hwmon people provide some
> > > > feedback and try and comply with their directions (based on the cpu
> > > > cycle I can spend on this).
> > > 
> > > What Arnd proposes doesn't sounds like a very good idea. PWM-controlled
> > > fans should be able to work just fine using a generic driver that uses
> > > the PWM framework, similar to the PWM backlight and LED drivers.
> > > 
> > Isn't that exactly what Arnd proposed ?
> 
> Oh, right. I meant to say: "What Arnd proposes sounds like a very good
> idea." =) Sorry for the confusion.
> 
I looked into it, and frankly I don't know how to make it work either. The chip
is dedicated to fan control and supports both linear and pwm mode. Both modes
are controlled differently. The available configuration options are very fan
control specific.

While I agree that a generic fan control driver for pwm chips would be great,
problem here is that this is not a generic pwm controller. 

Thanks,
Guenter
