From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/3] drivers: hwmon: Add W83773G driver
Date: Wed, 8 Nov 2017 09:59:06 -0800
Message-ID: <20171108175906.GA18718@roeck-us.net>
References: <1510043274-4778-1-git-send-email-mine260309@gmail.com>
 <1510043274-4778-3-git-send-email-mine260309@gmail.com>
 <f02b61f8-ebda-6bfd-ec4e-d64b3bd488b4@roeck-us.net>
 <CAARXrt=zi4DpGVpH5Cjsr8+m20LdG7JXf7jRqzfzcSJ4isa97g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAARXrt=zi4DpGVpH5Cjsr8+m20LdG7JXf7jRqzfzcSJ4isa97g@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Lei YU <mine260309@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 08, 2017 at 02:03:34PM +0800, Lei YU wrote:
> On Tue, Nov 7, 2017 at 10:33 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 11/07/2017 12:27 AM, Lei YU wrote:
> >>
> >> Nuvoton W83773G is a hardware monitor IC providing one local
> >> temperature and two remote temperature sensors.
> >>
> >> Signed-off-by: Lei YU <mine260309@gmail.com>
> >> ---
> >> v2:
> >>   - Rewrite the driver using regmap
> >>   - Add offset and update_interval
[ ... ]

> >> +       hwmon_dev = devm_hwmon_device_register_with_groups(dev,
> >> client->name,
> >> +                                                     regmap,
> >> w83773g_groups);
> >
> >
> > You lost me here. Why did you stop using the new API ?
> 
> I was referencing some other hwmon driver (e.g. tmp401.c) and find out
> the usage of SENSOR_DEVICE_ATTR, which I feel more clear and straightforward.
> 

The new API is supposed to replace the old API to make it independent from
sysfs and to simplify the actual driver code. On a driver like this, using
the new API should reduce code and data size by 30% or more.

If you find the new API to be less clear and less straigtforward to use than
the old API, we need to improve it. Do you have any suggestions ?

Thanks,
Guenter
