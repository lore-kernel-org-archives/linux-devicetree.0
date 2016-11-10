From: Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH v3 00/10] Add DT support for ohci-da8xx
Date: Thu, 10 Nov 2016 18:28:42 +0100
Message-ID: <CAKXjFTMGPsZxSWmX0_+n=9dGX5J=QdxeWQDEXHzC70bOT_4uwA@mail.gmail.com>
References: <20161107203948.28324-1-ahaslam@baylibre.com>
 <CAKXjFTN04Wz5jsaHsyvDD7G8QqXQvCE4D-YbHtGT=jUqELiS_w@mail.gmail.com>
 <20161110120253.GA5385@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161110120253.GA5385@kroah.com>
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
Cc: devicetree@vger.kernel.org, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, linux-usb@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 10, 2016 at 1:02 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Nov 08, 2016 at 05:37:41PM +0100, Axel Haslam wrote:
>> Hi,
>>
>> On Mon, Nov 7, 2016 at 9:39 PM, Axel Haslam <ahaslam@baylibre.com> wrote:
>> > The purpose of this patch series is to add DT support for the davinci
>> > ohci driver.
>> >
>>
>> To make it easier to review. I will split the arch/arm and driver
>> patches into separate series.
>
> I don't think it's easier, as now I have no idea what order, or what
> tree it should go through :(

Hi Greg,

i will resend the series one by one and wait for each to be merged
before sending the next, so that there is no confusion on the ordering
or on what tree they should apply.

Regards
Axel.

>
> I'm guessing not mine, so all are now deleted from my patch queue...
>
> greg k-h
