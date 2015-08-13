From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 5/6] mailbox: Add generic mechanism for testing Mailbox
 Controllers
Date: Thu, 13 Aug 2015 19:16:20 +0530
Message-ID: <CABb+yY2N6=oTrwni0tw1WffLv-udtBWh9LJR43EMVqYf+i2xUg@mail.gmail.com>
References: <20150812102328.GD18282@x1>
 <CABb+yY0A74Vy3-KOvj0URU_4zb2FAC7Yp3gmEwnFaBrD0mzt0w@mail.gmail.com>
 <20150813091914.GB8782@x1>
 <CABb+yY0cgbtM68-E_Xqgh5O6GRLXESYTLa5WcAwUBoVL3ufrxA@mail.gmail.com>
 <20150813102335.GC8782@x1>
 <CABb+yY3z7p97eOhncQ2i+g6yoYGfDgSN9BDPKmiDaVLa3oPocA@mail.gmail.com>
 <20150813110008.GD8782@x1>
 <CABb+yY34i=VUnswUE21vgeQYAGOS=7uwvdnTAFFgYkTV0CFk=w@mail.gmail.com>
 <20150813114005.GF8782@x1>
 <CABb+yY2OH16mgOwi=yH_eEHQN2Ck2x5xtVk-p-8Un9gGmcACdw@mail.gmail.com>
 <20150813130736.GG8782@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150813130736.GG8782@x1>
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
Cc: Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 13, 2015 at 6:37 PM, Lee Jones <lee.jones@linaro.org> wrote:
>
> Now just agree with me that mbox_request_chan() should fail on request
> of a known bad configuration request and I can code all this up and
> re-submit. :D
>
You make me look like a jerk :(   My problem is not with validation as
such. I see problem in the way you implement that makes validation
necessary. I'll explain step-by-step in the driver post.
