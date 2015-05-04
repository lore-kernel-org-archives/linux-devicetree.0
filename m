From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v7 3/5] Documentation: Add documentation for the APM
 X-Gene SoC EDAC DTS binding
Date: Mon, 4 May 2015 17:36:19 -0500
Message-ID: <CAL_JsqLyyBCd3DcwjWw57XCQ0fEWHXo_0dkWeBo=TVDoXM_zhQ@mail.gmail.com>
References: <1430259045-19012-1-git-send-email-lho@apm.com>
 <7128860.xHITr0VFap@wuerfel> <20150430094134.GD3488@pd.tnic>
 <10227049.9i19zDi2y3@wuerfel> <20150430130028.GF3488@pd.tnic>
 <CAPw-ZTnuyB2ne1C2-38qAxM_ANwdr9nuCYUMj=aTx7c90sVg+Q@mail.gmail.com>
 <20150430171846.GJ3488@pd.tnic>
 <CAPw-ZTksYNDE2zVD=ZjGzpKfXQN8KgW85ZnHoQ2eVmSGdSdMOw@mail.gmail.com>
 <CAL_JsqL7emqq=bSaWSi_0G5qSJqO+nVH_JH7VY+ynbrHhaSf_g@mail.gmail.com>
 <CAPw-ZTnNEiTA-MJthY04yCrc9RdZOUFaNjzBHFV1fWzkBqRCyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPw-ZTnNEiTA-MJthY04yCrc9RdZOUFaNjzBHFV1fWzkBqRCyQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Loc Ho <lho@apm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, "jcm@redhat.com" <jcm@redhat.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "patches@apm.com" <patches@apm.com>, Feng Kan <fkan@apm.com>, Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>, Doug Thompson <dougthompson@xmission.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 1, 2015 at 2:59 PM, Loc Ho <lho@apm.com> wrote:
> Hi Rob,
>
>>>>> I think we should first agreed on the DT binding and let's not worry
>>>>> about APEI. Then, whether we have one file or multiple file. Again,
>>>>> the HW consist of:
>>>>>
>>>>> 1. One top level interrupt and status registers
>>
>> For these registers, are there ECC specific functions here or just
>> normal interrupt control/status bits (mask/unmask/status)? Assuming
>> the later, then you should make this block an interrupt-controller.
>> Then this is the interrupt-parent for the rest of the blocks.
>>
>
> This is the only item remain before I generate an patch with just the
> memory controller. Most of the code that I see are actually an
> interrupt controller HW. As it is just an interrupt mask and status
> registers, is there an example in Linux that I can model after? Also,
> I am not quite convince as to why we can't just share the interrupt
> and request it by each memory controller?

Pretty much anything that calls irq_set_chained_handler. If you don't
need to touch the shared registers and can set them up once at boot
time, then you could just do shared irq handlers. But if you have to
clear the interrupt within the PCP, you need a demuxer.

Rob
