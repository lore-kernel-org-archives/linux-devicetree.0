From: Jan Kiszka <jan.kiszka@web.de>
Subject: Re: [PATCH v7 2/5] of: change overlay apply input data from
 unflattened to FDT
Date: Wed, 25 Apr 2018 07:38:02 +0200
Message-ID: <becdd908-f075-e434-1ac0-6bc9cfe3829e@web.de>
References: <1520122673-11003-1-git-send-email-frowand.list@gmail.com>
 <1520122673-11003-3-git-send-email-frowand.list@gmail.com>
 <09e3db63-cbf9-52a2-ee77-520979f17fea@web.de>
 <7bbf615b-3cdd-6bb4-6918-33e48de4225d@gmail.com>
 <a21dbee8-6e4e-9ceb-c798-dda43c2eae2d@web.de>
 <d7e94a45-5d46-0491-e5dc-2b098a11c5b1@gmail.com>
 <CAL_Jsq+MmUTMrd+jNqUB2=A-q3cCy7+QWOKG0iF6zM0hjCy3PQ@mail.gmail.com>
 <e508f3de-f21b-2510-2c6a-b810073ba1a7@web.de>
 <e06d1c0f-f60d-fc23-cd74-82f557dbc432@web.de>
 <7bbb9472-9c96-6012-68e6-4ec2773c7732@gmail.com>
 <4422f58a-ca7c-16e6-e0df-63faea50f553@web.de>
 <CANk1AXQKSS+rwbXzPRkF4V_TXA56fQR+1EVFyspCM7dpVNJaQA@mail.gmail.com>
 <CANk1AXT=zuKHgV4yUVTyWTHmbh5mYtNaO5GfiyDo99zhe4sQXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <jailhouse-dev+bncBDDNLV6S7AOBBP5IQDLQKGQEQRCDRKI@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
In-Reply-To: <CANk1AXT=zuKHgV4yUVTyWTHmbh5mYtNaO5GfiyDo99zhe4sQXQ@mail.gmail.com>
Content-Language: en-US
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: Alan Tull <atull@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jailhouse <jailhouse-dev@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On 2018-04-24 20:26, Alan Tull wrote:
> On Tue, Apr 24, 2018 at 11:08 AM, Alan Tull <atull@kernel.org> wrote:
>> On Tue, Apr 24, 2018 at 12:29 AM, Jan Kiszka <jan.kiszka@web.de> wrote:
>>>
>>> We have drivers/fpga/of-fpga-region.c in-tree, and that does not seem to
>>> store any pointers to objects, rather consumes them in-place. And I
>>> would consider it fair to impose such a limitation on the notifier
>>> interface.
>>
>> The FPGA code was written assuming that overlays could be removed.
> 
> To be more specific, drivers/fpga/of-fpga-region.c currently saves a
> pointer to the overlay and uses it only during the pre-apply
> notification.

Even more exactly: You are saving a reference during pre-apply and
freeing that one again on the corresponding post-remove. That is what I
would have expected as normal usage of the notification API as well.

Jan
