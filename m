From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: add GPIO nodes for the BG2Q
Date: Tue, 15 Apr 2014 14:50:14 +0200
Message-ID: <534D2B06.6000408@gmail.com>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397549245-3338-3-git-send-email-antoine.tenart@free-electrons.com>
 <534CFA77.9030108@gmail.com> <20140415180058.2fefca78@xhacker>
 <534D0943.2050100@gmail.com> <20140415114848.GA2813@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140415114848.GA2813@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Jisheng Zhang <jszhang@marvell.com>, Jimmy Xu <zmxu@marvell.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?ISO-8859-1?Q?Antoine_T=E9nar?= =?ISO-8859-1?Q?t?= <antoine.tenart@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/15/2014 01:48 PM, Alexandre Belloni wrote:
> On 15/04/2014 at 12:26:11 +0200, Sebastian Hesselbarth wrote :
>> On 04/15/2014 12:00 PM, Jisheng Zhang wrote:
>>> On Tue, 15 Apr 2014 02:23:03 -0700
>>> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
>>>> I am fine with using nr-gpios property now, but I guess BG2Q also
>>>> has that CONFIG[1,2] registers to actually read out the features
>>>> synthesized in? If I find some time, I'll prepare a patch for
>>>> dw-apb-gpio to exploit that (optional) information instead of
>>>> using nr-gpios.
>>>
>>> The problem is CONFIG1/2 registers don't exist on some versions.
>>> For example, the version used in BG2/BG2CD. So nr-gpio is necessary
>>> if we want to support these versions.
>>
>> Hmm, are you sure about BG2? I remember reading it and it contains
>> sane values. Anyway, a proper patch for dw-apb-gpio would include
>> checking for sane (e.g. non-zero) values. And nr-gpios will always
>> stay as fall-back just because e.g. sunxi does not have the CONFIG
>> registers.
>
> Shouldn't that be use nr-gpios and if not available, read the CONFIG
> registers? Else, what about bogus registers ?

Probably, it is a better idea to only look for CONFIG registers if
nr-gpios is not set. Anyway, I'll really have to find more time first ;)

Sebastian
