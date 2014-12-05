From: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [kernel PATCH v2 2/2] devicetree: document ARM
 bindings for QEMU's Firmware Config interface
Date: Fri, 05 Dec 2014 20:04:32 +0100
Message-ID: <548201C0.1060006@redhat.com>
References: <1417366282-13527-1-git-send-email-lersek@redhat.com>
	<1417366282-13527-3-git-send-email-lersek@redhat.com>
	<CAFEAcA_iY6qxiQO2oGJitZE6QTAwSsdzuF81q=N=Dt4QfjhpHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
In-Reply-To: <CAFEAcA_iY6qxiQO2oGJitZE6QTAwSsdzuF81q=N=Dt4QfjhpHQ@mail.gmail.com>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 12/05/14 19:57, Peter Maydell wrote:
> On 30 November 2014 at 16:51, Laszlo Ersek <lersek@redhat.com> wrote:
>> +Example:
>> +
>> +/ {
>> +       #size-cells = <0x2>;
>> +       #address-cells = <0x2>;
>> +
>> +       fw-cfg@9020000 {
>> +               compatible = "qemu,fw-cfg-mmio";
>> +               reg = <0x0 0x9020000 0x0 0x1000>;
>> +       };
> 
> I've just noticed that this example claims a register
> region size of 0x1000. This seems wrong, because the
> underlying device doesn't have a register range that
> big. Surely this should be a size of 0x3 ?

Arnd said I should round up the region to 0x1000.

http://thread.gmane.org/gmane.linux.drivers.devicetree/101173/focus=101176

If that's incorrect I'd prefer to post incremental patches, because 4
other series already depend on this kernel docs patch.

Thanks
Laszlo
