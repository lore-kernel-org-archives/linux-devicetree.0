From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/3] gpio: gpio-generic: Add 16 and 32 bit big endian
 byte order support
Date: Wed, 27 Mar 2013 09:58:48 +0100
Message-ID: <CACRpkdY6D3hvBm13Y41NTbnAav03guB7LEB4RHnRanFXjj_UJw@mail.gmail.com>
References: <1363355140-28216-1-git-send-email-andreas@gaisler.com>
 <1363355140-28216-2-git-send-email-andreas@gaisler.com>
 <20130319004012.GA1004@lizard.gateway.2wire.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130319004012.GA1004-1CZZkhFgUWNRmOO2HpYVOJIbA5emDH3N@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2013 at 1:40 AM, Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Mar 15, 2013 at 02:45:38PM +0100, Andreas Larsson wrote:
>> There is no general support for 64-bit big endian accesses, so that is
>> left unsupported.
>>
>> Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
>
> This looks perfect, thanks a lot!
>
> Acked-by: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>

Looks good to me as well, but since this was discussed with Grant
I want his review on this before I merge it.

Yours,
Linus Walleij
