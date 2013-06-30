From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] of/documentation: Update s5m8767-regulator bindings
 document
Date: Sun, 30 Jun 2013 10:31:33 +0530
Message-ID: <CAK9yfHyiJA0OXuEJyT26tRz9112T-0x4dKUFJ1DKjGYR_By_Cw@mail.gmail.com>
References: <1372066617-23518-1-git-send-email-sachin.kamat@linaro.org>
 <20130624152553.GT27646@sirena.org.uk>
 <CAK9yfHzBPO1Yr7_qLtw3oZKVVtqDBK_Yj7_r=HrU+94pod+XVA@mail.gmail.com>
 <20130628113505.GG27646@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130628113505.GG27646-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
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
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28 June 2013 17:05, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jun 25, 2013 at 11:56:12AM +0530, Sachin Kamat wrote:
>
>> There is no change in the bindings, but just a correction in the
>> documentation to reflect the
>> implementation. Earlier when Samsung platforms did not have pinctrl
>> driver, legacy GPIO driver
>> was used which took those 5 parameters. Now since we are using
>> pinctrl, we need only 3 parameters.
>> The document was somehow not updated to reflect this change.
>
> So there was a previous change to the code that mistakenly didn't update
> the binding document?

Yes, that is correct. In fact the changes happened during the review
process itself. Hence there is no commit history of this change.
However the binding document was not updated during the review phase
and the first version itself got committed as it is.

-- 
With warm regards,
Sachin
