From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon drivers
Date: Wed, 10 Jan 2018 11:17:55 +0100
Message-ID: <20180110101755.GA5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, arnd@arndb.de, linux-doc@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>, joel@jms.id.au, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 09, 2018 at 02:31:20PM -0800, Jae Hyun Yoo wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> 
> Hello,
> 
> This patch set provides support for PECI of AST2400/2500 which can give us PECI
> functionalities such as temperature monitoring, platform manageability,
> processor diagnostics and failure analysis. Also provides generic peci.h and
> peci_ioctl.h headers to provide compatibility to peci drivers that can be
> implemented later e.g. Nuvoton's BMC SoC family.

What is the "dev-4.10" in the subject for?  4.10 is really old and
obsolete :(

thanks,

greg k-h
