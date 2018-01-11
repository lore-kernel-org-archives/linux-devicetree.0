From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
Date: Fri, 12 Jan 2018 07:49:55 +1100
Message-ID: <1515703795.31850.45.camel@kernel.crashing.org>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
 <20180110101755.GA5822@kroah.com>
 <006c4a95-9299-bd17-6dec-52578e8461ae@linux.intel.com>
 <20180110191703.GA20248@kroah.com>
 <8997e43c-683e-418d-4e2b-1fe3fefe254e@linux.intel.com>
 <20180110202740.GA27703@kroah.com>
 <e81095ff-d491-9977-25e6-7ba6d28d5e72@linux.intel.com>
 <20180111073038.GA3600@kroah.com> <1515661011.31850.27.camel@au1.ibm.com>
 <20180111095923.GA29233@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180111095923.GA29233@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>, linux-arm-kernel@lists.infradead.org, linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

On Thu, 2018-01-11 at 10:59 +0100, Greg KH wrote:
> And, if you use it in a device, it's still totally unsupported and
> insecure.  Seriously, does no one actually pay attention to the patches
> I merge in the stable trees anymore?

Yeah not sure why we aren't picking an LTC here, it could be that it's
just a dev branch, not release, Joel, what's the process in that case ?

For anything going into products, if we're going to maintain a non-
upstream branch, we should definitely stick it to an LTS release or
we'll be missing a ton of security fixes.

Cheers,
Ben.
