From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 18/18] insert build break
Date: Wed, 18 Jan 2017 16:06:05 -0600
Message-ID: <CAL_JsqL-yQD=oFQW0YfB9JnSpDVcOcUG0GM8NgLCB1nsFQsrEQ@mail.gmail.com>
References: <1484260655-80477-1-git-send-email-christopher.lee.bostic@gmail.com>
 <20170113071545.GB12441@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170113071545.GB12441@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>, kbuild test robot <fengguang.wu@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Chris Bostic <cbostic@us.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, christopher.lee.bostic@gmail.com, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jeremy Kerr <jk@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 13, 2017 at 1:15 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Jan 12, 2017 at 04:37:35PM -0600, christopher.lee.bostic@gmail.com wrote:
>> From: Chris Bostic <cbostic@us.ibm.com>
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>
> I can not accept patches that have no changelog text, and this one is
> very odd:

Seems like this would be an easy check to add to 0-day. And perhaps
missing S-o-B, too.

Rob
