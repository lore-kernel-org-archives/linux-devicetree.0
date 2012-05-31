From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Thu, 31 May 2012 11:07:52 +0800
Message-ID: <CAN1soZz2=NcadK1kD6d9t92G6Xdfn=TPGP5_ngwX_fGj+QhOVA@mail.gmail.com>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-4-git-send-email-haojian.zhuang@gmail.com>
 <87ehq1tq5w.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87ehq1tq5w.fsf@laptop.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Ball <cjb@laptop.org>
Cc: eric.y.miao@gmail.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 31, 2012 at 3:38 AM, Chris Ball <cjb@laptop.org> wrote:
> Hi Haojian,
>

>
> Did you test non-DT boot with these changes?
>
I tested non-DT boot on my brownstone board on TTC dkb board.

It seems that you meet issue in icu_mux_irq_demux(). Could you give me
the detail which interrupt is running while you meet the error?

By the way, do you have the boot log?

Regards
Haojian
