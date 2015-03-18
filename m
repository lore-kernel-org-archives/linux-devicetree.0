From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 3/3] mailbox: Add support for ST's Mailbox IP
Date: Wed, 18 Mar 2015 19:02:07 +0530
Message-ID: <CABb+yY2HwZn3VSvZ4iVfWE8GrsLDA6Tx_V2HZiOBvJb9UHY2Mg@mail.gmail.com>
References: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
 <1425379283-1567-4-git-send-email-lee.jones@linaro.org>
 <CAJe_Zhc1uLf_grsbzOs3ahJHJXXZ+BF__702mEPPL=SWPU5nzw@mail.gmail.com>
 <20150318131226.GM3318@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150318131226.GM3318@x1>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, kernel@stlinux.com, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 18, 2015 at 6:42 PM, Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 04 Mar 2015, Jassi Brar wrote:
>
>> > +
>> > +       if ((!data) || (!sti_mbox_chan_is_tx(mbox)))
>> >
>> nit: too much protection.
>
> What makes you think that?
>
 Usually we write
               if (!data || !sti_mbox_chan_is_tx(mbox))


>> > +                       mbox->irq = irq_create_mapping(mbinst->irq_domain,
>> > +                                                      mbox->rx_id);
>> >
>> simply assigning same IRQ to all controller DT nodes and using
>> IRQF_SHARED for the common handler, wouldn't work?
>
> I do have intentions to simplify this driver somewhat, but that will
> take some time as it will require a great deal of consultation and
> testing from the ST side.  This is the current internal implementation
> which is used in the wild and has been fully tested.  If you'll allow
> me to conduct my adaptions subsequently we can have full history and a
> possible reversion plan if anything untoward take place i.e. I mess
> something up.
>
OK, but wouldn't that break the bindings of this driver when you
eventually do that?

>> > + * struct sti_mbox_msg - sti mailbox message description
>> > + * @dsize:             data payload size
>> > + * @pdata:             message data payload
>> > + */
>> > +struct sti_mbox_msg {
>> > +       u32             dsize;
>> > +       u8              *pdata;
>> > +};
>> >
>> There isn't any client driver in this patchset to tell exactly, but it
>> seems the header could be split into one shared between mailbox
>> clients and provider and another internal to client/provider ?
>
> I believe only the above will be required by the client.  Seems silly
> to create a client specific header just for that, don't you think?
>
Do you mean to have copies of the structure in controller and client driver? :O

-Jassi
