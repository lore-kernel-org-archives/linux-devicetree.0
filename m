From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: [RESEND PATCH 2/4] ARM: dts: keystone: Add generic compatible
 string for I2C EEPROM
Date: Sat, 2 Dec 2017 19:57:57 -0800
Message-ID: <b98fb17b-289c-4756-cfca-85e633b55354@oracle.com>
References: <20171124162750.18756-1-javierm@redhat.com>
 <20171124162750.18756-2-javierm@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171124162750.18756-2-javierm@redhat.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, arnd@arndb.de, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Santosh Shilimkar <ssantosh@kernel.org>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/24/17 8:27 AM, Javier Martinez Canillas wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
> 
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
> 
> So add this generic fallback to the device node compatible string to make
> the device to match the driver using the OF device ID table.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
Applied
