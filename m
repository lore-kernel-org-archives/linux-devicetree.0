From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 07/13] staging: typec: tcpci: register port before
 request irq
Date: Sat, 31 Mar 2018 11:01:57 +0300
Message-ID: <20180331080157.p43cejithiyiutix@mwanda>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-8-git-send-email-jun.li@nxp.com>
 <20180329105212.lp5oydu4uejeo4h4@mwanda>
 <AM0PR0402MB3908D9613B00EA703D2B542A89A00@AM0PR0402MB3908.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3908D9613B00EA703D2B542A89A00@AM0PR0402MB3908.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jun Li <jun.li@nxp.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 31, 2018 at 03:09:44AM +0000, Jun Li wrote:
> This patch is to change the sequence of register port and request irq,
> if error code checking of original code has the problem, I think that
> should be another patch to fix it, I can do that later.

Fair enough.  That's reasonable.  Thanks!

regards,
dan carpenter
