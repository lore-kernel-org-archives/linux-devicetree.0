From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 08/16] drivers/fsi: Add crc4 helpers
Date: Wed, 7 Dec 2016 10:02:19 +0100
Message-ID: <20161207090219.GA14742@kroah.com>
References: <1481076574-54711-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481076574-54711-2-git-send-email-christopher.lee.bostic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1481076574-54711-2-git-send-email-christopher.lee.bostic@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Bostic <christopher.lee.bostic@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benh@kernel.crashing.org, geert+renesas@glider.be, andrew@aj.id.au, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux@armlinux.org.uk, Chris Bostic <cbostic@us.ibm.com>, sre@kernel.org, robh+dt@kernel.org, Jeremy Kerr <jk@ozlabs.org>, alistair@popple.id.au, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 08:09:31PM -0600, Chris Bostic wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> Add some helpers for the crc checks for the slave configuration table.
> This works 4-bits-at-a-time, using a simple table approach.
> 
> We will need this in the FSI core code, as well as any master
> implementations that need to calculate CRCs in software.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
> ---
>  drivers/fsi/fsi-core.c   | 21 +++++++++++++++++++++
>  drivers/fsi/fsi-master.h | 21 +++++++++++++++++++++
>  2 files changed, 42 insertions(+)

Why not just create lib/crc4.c with these functions, like the other crc
functions in the kernel?  Don't bury these in some random driver
subsystem please.

thanks,

greg k-h
